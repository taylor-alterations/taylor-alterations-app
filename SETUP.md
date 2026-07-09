# Taylor Alterations & More LLC — App Setup Guide
# Complete setup in about 30 minutes

==============================================
STEP 1 — CREATE YOUR SUPABASE DATABASE
==============================================

1. Go to https://supabase.com and click "Start your project"
2. Sign up with Google or email
3. Click "New Project"
   - Name: taylor-alterations
   - Database Password: (save this somewhere safe!)
   - Region: US East (N. Virginia)
4. Wait ~2 minutes for it to set up
5. Click "SQL Editor" in the left sidebar
6. Click "New Query"
7. Open the file: supabase-setup.sql
8. Copy ALL of it and paste into the SQL editor
9. Click "Run" — you should see "Success"

Now get your API keys:
10. Click "Project Settings" (gear icon) → "API"
11. Copy your:
    - Project URL (looks like: https://xxxxx.supabase.co)
    - anon / public key (long string starting with eyJ...)

==============================================
STEP 2 — EDIT YOUR CONFIG FILE
==============================================

Open config.js in a text editor (Notepad is fine) and fill in:

  const SUPABASE_URL = 'paste your Project URL here';
  const SUPABASE_ANON_KEY = 'paste your anon key here';
  const ADMIN_PASSWORD = 'choose your own password here';

Save the file.

==============================================
STEP 3 — CREATE GITHUB ACCOUNT & REPOSITORY
==============================================

1. Go to https://github.com and sign up (free)
2. Click the "+" in top right → "New repository"
3. Name it: taylor-alterations-app
4. Make it Public (required for free Vercel)
5. Click "Create repository"
6. Click "uploading an existing file"
7. Drag ALL these files into the upload area:
   - index.html
   - admin.html
   - approve.html
   - config.js
   - vercel.json
   - supabase-setup.sql (optional, for reference)
8. Click "Commit changes"

==============================================
STEP 4 — DEPLOY ON VERCEL
==============================================

1. Go to https://vercel.com and click "Sign Up"
2. Sign up with GitHub (click "Continue with GitHub")
3. Click "Add New Project"
4. Find "taylor-alterations-app" and click "Import"
5. Leave all settings as default
6. Click "Deploy"
7. Wait ~1 minute
8. Vercel gives you a URL like:
   https://taylor-alterations-app.vercel.app

THAT'S IT — YOUR APP IS LIVE! 🎉

==============================================
YOUR APP URLS
==============================================

Client Request Form:
  https://taylor-alterations-app.vercel.app

Admin Dashboard (only you):
  https://taylor-alterations-app.vercel.app/admin
  Password: whatever you set in config.js

Client Quote Approval (auto-generated per quote):
  https://taylor-alterations-app.vercel.app/approve?token=...

==============================================
OPTIONAL — CUSTOM DOMAIN NAME
==============================================

Want tayloralterations.com instead of vercel.app?

1. Buy a domain from Namecheap.com (~$10/year)
2. In Vercel: go to your project → Settings → Domains
3. Add your domain and follow the instructions
4. Takes about 10 minutes to go live

==============================================
HOW TO USE THE APP
==============================================

SHARING WITH CLIENTS:
- Send them your main URL for the request form
- When you send a quote, they get a unique approval link
- They tap Approve or Decline — you see it update instantly

DAILY WORKFLOW:
1. Open /admin on your phone
2. Check "Requests" tab for new form submissions
3. Convert requests to jobs, then go to Calculator to quote
4. Send quote via text — client gets an approval link
5. When they approve, job moves to Approved on the board
6. Move jobs through: Approved → In Progress → Ready → Done

==============================================
NEED HELP?
==============================================

If you get stuck on any step, just message Claude with:
"I'm on Step X of the Taylor Alterations setup and..."
and paste the error message you see.

==============================================
