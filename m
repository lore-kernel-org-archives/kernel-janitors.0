From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 14:06:37 +0000
Subject: Re: [PATCH 29/56] irda: Remove void casts
Message-Id: <49DCAF6D.6080704@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-24-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-26-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-27-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080531p5167e7f6j12617436084fabfa@mail.gmail.com>
In-Reply-To: <36ca99e90904080531p5167e7f6j12617436084fabfa@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

Fixed patch

Thanks,

Jack

--

irda: Remove void casts

From: Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---

 net/irda/discovery.c         |    4 ++--
 net/irda/ircomm/ircomm_lmp.c |    2 +-
 net/irda/iriap.c             |    2 +-
 net/irda/irnet/irnet_irda.c  |    3 +--
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/net/irda/discovery.c b/net/irda/discovery.c
index a6f99b5..7fdc346 100644
--- a/net/irda/discovery.c
+++ b/net/irda/discovery.c
@@ -130,11 +130,11 @@ void irlmp_add_discovery_log(hashbin_t *cachelog,
hashbin_t *log)
      * no need to lock it.
      * We just need to lock the global log in irlmp_add_discovery().
      */
-    discovery = (discovery_t *) hashbin_remove_first(log);
+    discovery = hashbin_remove_first(log);
     while (discovery != NULL) {
         irlmp_add_discovery(cachelog, discovery);
 
-        discovery = (discovery_t *) hashbin_remove_first(log);
+        discovery = hashbin_remove_first(log);
     }
 
     /* Delete the now empty log */
diff --git a/net/irda/ircomm/ircomm_lmp.c b/net/irda/ircomm/ircomm_lmp.c
index 67c99d2..6245b45 100644
--- a/net/irda/ircomm/ircomm_lmp.c
+++ b/net/irda/ircomm/ircomm_lmp.c
@@ -152,7 +152,7 @@ static void ircomm_lmp_flow_control(struct sk_buff *skb)
 
     line = cb->line;
 
-    self = (struct ircomm_cb *) hashbin_lock_find(ircomm, line, NULL);
+    self = hashbin_lock_find(ircomm, line, NULL);
     if (!self) {
         IRDA_DEBUG(2, "%s(), didn't find myself\n", __func__ );
         return;
diff --git a/net/irda/iriap.c b/net/irda/iriap.c
index 4a105dc..12cb0e9 100644
--- a/net/irda/iriap.c
+++ b/net/irda/iriap.c
@@ -251,7 +251,7 @@ void iriap_close(struct iriap_cb *self)
         self->lsap = NULL;
     }
 
-    entry = (struct iriap_cb *) hashbin_remove(iriap, (long) self, NULL);
+    entry = hashbin_remove(iriap, (long) self, NULL);
     IRDA_ASSERT(entry = self, return;);
 
     __iriap_close(self);
diff --git a/net/irda/irnet/irnet_irda.c b/net/irda/irnet/irnet_irda.c
index cf9a4b5..3a89247 100644
--- a/net/irda/irnet/irnet_irda.c
+++ b/net/irda/irnet/irnet_irda.c
@@ -766,8 +766,7 @@ irnet_find_socket(irnet_socket *    self)
    * requested that nickname */
   if(err = 0)
     {
-      new = (irnet_socket *) hashbin_find(irnet_server.list,
-                      0, self->rname);
+      new = hashbin_find(irnet_server.list, 0, self->rname);
       if(new)
     DEBUG(IRDA_SERV_INFO, "Socket 0x%p matches rname ``%s''.\n",
           new, new->rname);
