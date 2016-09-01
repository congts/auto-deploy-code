# auto-deploy-code
This script to deploy (pull and update) code automatically on the develop or production environment

Usage:
-------
Upload files deploy.php and deploy.sh to your home directory (Example: ~/public_html)

```
chmod +x deploy.sh
```
By default, the script uses "develop" branch to deploy code automatically.
To change your branch name, please edit deploy.php file (line 5)
	$deployBranch = 'develop'; // change your branch

Update the webhook in your GIT repository
	Github: Choose your repository => Setting => Webhooks & services

	Gitlab: Choose your repository => Setting => Web Hooks

	Bitbucket: Choose your repository => Setting => INTEGRATIONS => Webhooks

Then add your URL into Webhook information
	http://yoursite.com/deploy.php
Content type: "application/json" (if needed)
Events (Choose push event):
Which events would you like to trigger this webhook?: "Just the push event."

### Others
You can update other actions (clear cache, session, etc) after the code is updated.
Edit file deploy.sh (line 58)
	rm -rf var/cache
