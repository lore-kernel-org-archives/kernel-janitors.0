From: Dan Carpenter <error27@gmail.com>
Date: Sat, 13 Mar 2010 11:14:22 +0000
Subject: [patch] tomoyo: fix potential use after free
Message-Id: <20100313111422.GA2594@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kentaro Takeda <takedakn@nttdata.co.jp>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, James Morris <jmorris@namei.org>, Serge Hallyn <serue@us.ibm.com>, Toshiharu Harada <haradats@nttdata.co.jp>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code returns a freed pointer.  This function is expected to 
return NULL on errors.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/tomoyo/common.c b/security/tomoyo/common.c
index ff51f10..ef89947 100644
--- a/security/tomoyo/common.c
+++ b/security/tomoyo/common.c
@@ -886,6 +886,7 @@ static struct tomoyo_profile *tomoyo_find_or_assign_new_profile(const unsigned
 	ptr = kmalloc(sizeof(*ptr), GFP_KERNEL);
 	if (!tomoyo_memory_ok(ptr)) {
 		kfree(ptr);
+		ptr = NULL;
 		goto ok;
 	}
 	for (i = 0; i < TOMOYO_MAX_CONTROL_INDEX; i++)
