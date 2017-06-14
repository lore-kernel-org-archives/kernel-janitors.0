From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 10:29:31 +0000
Subject: [PATCH net] net/act_pedit: fix an error code
Message-Id: <20170614102930.GH29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Amir Vadai <amir@vadai.me>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

I'm reviewing static checker warnings where we do ERR_PTR(0), which is
the same as NULL.  I'm pretty sure we intended to return ERR_PTR(-EINVAL)
here.  Sometimes these bugs lead to a NULL dereference but I don't
immediately see that problem here.

Fixes: 71d0ed7079df ("net/act_pedit: Support using offset relative to the conventional network headers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sched/act_pedit.c b/net/sched/act_pedit.c
index 164b5ac094be..7dc5892671c8 100644
--- a/net/sched/act_pedit.c
+++ b/net/sched/act_pedit.c
@@ -94,8 +94,10 @@ static struct tcf_pedit_key_ex *tcf_pedit_keys_ex_parse(struct nlattr *nla,
 		k++;
 	}
 
-	if (n)
+	if (n) {
+		err = -EINVAL;
 		goto err_out;
+	}
 
 	return keys_ex;
 
