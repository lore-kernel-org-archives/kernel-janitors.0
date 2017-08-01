From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Date: Tue, 01 Aug 2017 23:10:21 +0000
Subject: Re: [PATCH 1/3] lib/test_kmod: tidy up bounds checking
Message-Id: <20170801231021.GY18884@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170707083933.2mgnpqafhspbwu7h@mwanda>
In-Reply-To: <20170707083933.2mgnpqafhspbwu7h@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 07, 2017 at 11:39:33AM +0300, Dan Carpenter wrote:
> There is technically a bug where we don't test for negatives in
> test_dev_config_update_uint_sync().  "new" is long and UINT_MAX is
> unsigned int so on 64 bit systems negatives are allowed.

Good catch. I however prefer we instead just replace kstrtol() with
kstrtoul() in both of these cases as an atomic separate patch with
a Fixes tag. I'll do this and roll in your other patches. Below is
what I mean as one atomic fix.

diff --git a/lib/test_kmod.c b/lib/test_kmod.c
index 90c91541fc16..8fc0a7a19c83 100644
--- a/lib/test_kmod.c
+++ b/lib/test_kmod.c
@@ -880,10 +880,10 @@ static int test_dev_config_update_uint_sync(struct kmod_test_device *test_dev,
 					    int (*test_sync)(struct kmod_test_device *test_dev))
 {
 	int ret;
-	long new;
+	unsigned long new;
 	unsigned int old_val;
 
-	ret = kstrtol(buf, 10, &new);
+	ret = kstrtoul(buf, 10, &new);
 	if (ret)
 		return ret;
 
@@ -918,9 +918,9 @@ static int test_dev_config_update_uint_range(struct kmod_test_device *test_dev,
 					     unsigned int max)
 {
 	int ret;
-	long new;
+	unsigned long new;
 
-	ret = kstrtol(buf, 10, &new);
+	ret = kstrtoul(buf, 10, &new);
 	if (ret)
 		return ret;
 
> In the next test I removed the UINT_MAX comparison because "max" is
> already an unsigned int so we already know that "new" can't be larger
> than UINT_MAX.

Makes sense, will roll this in as a separate patch on your part.

> On the third test, I just flipped the tests around so we consistently
> test the lower bound before the upper bound.

And since non-functional I will also split up into another patch.

  Luis
