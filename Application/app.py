from flask import Flask, render_template
import pyodbc

app = Flask(__name__)

# SQL Server connection configuration
conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=localhost\\SQLEXPRESS;"
    "DATABASE=EventEaseDB;"
    "Trusted_Connection=yes;"
)

@app.route('/')
def index():
    try:
        # Connect to EventEaseDB
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()
        
        # Query EventDetails view
        cursor.execute("""
            SELECT EventID, EventName, Type, StartDate, VenueName
            FROM EventDetails
            ORDER BY StartDate
        """)
        events = cursor.fetchall()
        
        # Convert to list of dictionaries for template
        events_list = [
            {
                'EventID': row.EventID,
                'EventName': row.EventName,
                'Type': row.Type,
                'StartDate': row.StartDate.strftime('%Y-%m-%d'),
                'VenueName': row.VenueName
            } for row in events
        ]
        
        cursor.close()
        conn.close()
        
        return render_template('index.html', events=events_list)
    
    except Exception as e:
        return f"Error: {str(e)}", 500

if __name__ == '__main__':
    app.run(debug=True)