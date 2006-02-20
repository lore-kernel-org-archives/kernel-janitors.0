From: Stephan Peijnik <sp@sp.or.at>
Date: Mon, 20 Feb 2006 19:49:44 +0000
Subject: [KJ] [PATCH] Fix warning in kernel/audit.c, kauditd_thread
Message-Id: <1140464985.13643.17.camel@tyrael2>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97585486955071565=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97585486955071565==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The warning has come to my attention while compiling 2.6.16-rc4.

kauditd_thread in kernel/audit.c should be returning an int value,
however, it doesn't and gcc isn't too happy about it.
Due to the endless loop in kauditd_thread we may never ever come that
far to actually return a value. Adding a 'return 0;' removes
the warning though.

Guess that's enough if not even too much information on such a trivial
change.

Signed-off-by: Stephan Peijnik <sp@sp.or.at>

---

diff --git a/kernel/audit.c b/kernel/audit.c
index 0a813d2..7e2f232 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -300,6 +300,8 @@ static int kauditd_thread(void *dummy)
 			remove_wait_queue(&kauditd_wait, &wait);
 		}
 	}
+	
+	return 0;
 }
 
 void audit_send_reply(int pid, int seq, int type, int done, int multi,



--===============97585486955071565==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97585486955071565==--
