From: Dan Carpenter <error27@gmail.com>
Date: Tue, 13 Jul 2010 13:21:52 +0000
Subject: [patch] net/sched: potential data corruption
Message-Id: <20100713132152.GL5658@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <hadi@cyberus.ca>
Cc: "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <shemminger@vyatta.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, matthew@wil.cx

The reset_policy() does:
        memset(d->tcfd_defdata, 0, SIMP_MAX_DATA);
        strlcpy(d->tcfd_defdata, defdata, SIMP_MAX_DATA);

In the original code, the size of d->tcfd_defdata wasn't fixed and if
strlen(defdata) was less than 31, reset_policy() would cause memory
corruption.

Please Note:  The original alloc_defdata() assumes defdata is 32
characters and a NUL terminator while reset_policy() assumes defdata is
31 characters and a NUL.  This patch updates alloc_defdata() to match
reset_policy() (ie a shorter string).  I'm not very familiar with this
code so please review carefully.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/sched/act_simple.c b/net/sched/act_simple.c
index 1b4bc69..4a1d640 100644
--- a/net/sched/act_simple.c
+++ b/net/sched/act_simple.c
@@ -73,10 +73,10 @@ static int tcf_simp_release(struct tcf_defact *d, int bind)
 
 static int alloc_defdata(struct tcf_defact *d, char *defdata)
 {
-	d->tcfd_defdata = kstrndup(defdata, SIMP_MAX_DATA, GFP_KERNEL);
+	d->tcfd_defdata = kzalloc(SIMP_MAX_DATA, GFP_KERNEL);
 	if (unlikely(!d->tcfd_defdata))
 		return -ENOMEM;
-
+	strlcpy(d->tcfd_defdata, defdata, SIMP_MAX_DATA);
 	return 0;
 }
 
