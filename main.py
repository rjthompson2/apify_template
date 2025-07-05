import json
from apify_client import ApifyClient

# Input token here
client = ApifyClient(token='')

def is_on_apify():
    return 'APIFY_IS_AT_HOME' in environ

# Push the solution to the dataset
def set_output(data):
    if not is_on_apify():
        with open('./apify_storage/datasets/default/solution.json', 'w') as output:
            return output.write(json.dumps(data, indent=2))

    dataset = client.dataset(environ.get('APIFY_DEFAULT_DATASET_ID'))
    dataset.push_items([data])

# Your code here