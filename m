From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 13:27:10 +0000
Subject: [patch] sound: sys_timer: indent poll_def_tmr() correctly
Message-Id: <20150225132709.GN19745@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

The indenting here was really whacky and not consistent from one line to
the next.  I also reverse the "if (opened)" and "if (tmr_running)" tests
so that I could remove two indent levels.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/oss/sys_timer.c b/sound/oss/sys_timer.c
index 9f03983..2226dda 100644
--- a/sound/oss/sys_timer.c
+++ b/sound/oss/sys_timer.c
@@ -50,29 +50,24 @@ tmr2ticks(int tmr_value)
 static void
 poll_def_tmr(unsigned long dummy)
 {
+	if (!opened)
+		return;
+	def_tmr.expires = (1) + jiffies;
+	add_timer(&def_tmr);
 
-	if (opened)
-	  {
+	if (!tmr_running)
+		return;
 
-		  {
-			  def_tmr.expires = (1) + jiffies;
-			  add_timer(&def_tmr);
-		  }
+	spin_lock(&lock);
+	tmr_ctr++;
+	curr_ticks = ticks_offs + tmr2ticks(tmr_ctr);
 
-		  if (tmr_running)
-		    {
-				spin_lock(&lock);
-			    tmr_ctr++;
-			    curr_ticks = ticks_offs + tmr2ticks(tmr_ctr);
-
-			    if (curr_ticks >= next_event_time)
-			      {
-				      next_event_time = (unsigned long) -1;
-				      sequencer_timer(0);
-			      }
-				spin_unlock(&lock);
-		    }
-	  }
+	if (curr_ticks >= next_event_time) {
+		next_event_time = (unsigned long) -1;
+		sequencer_timer(0);
+	}
+
+	spin_unlock(&lock);
 }
 
 static void
