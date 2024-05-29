import requests
import json

def get_metadata():
    # Azure Instance Metadata Service endpoint
    metadata_url = "http://169.254.169.254/metadata/instance?api-version=2021-02-01"
    
    try:
        # Sending the GET request
        response = requests.get(metadata_url)
        
        # Raise an exception for any unsuccessful status codes
        response.raise_for_status()
        
        # Parse the response JSON
        metadata = response.json()
        
        # Format the output as pretty-printed JSON
        formatted_metadata = json.dumps(metadata)
        
        return formatted_metadata
    
    except requests.exceptions.RequestException as e:
        return f"An error occurred: {e}"

if __name__ == "__main__":
    metadata = get_metadata()
    print(metadata)
