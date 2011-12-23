From: Julia Lawall <julia@diku.dk>
Date: Fri, 23 Dec 2011 17:39:26 +0000
Subject: [PATCH 1/9] drivers/mfd/88pm860x-i2c.c: introduce missing kfree
Message-Id: <1324661974-17281-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Error handling code following a kzalloc should free the allocated data.  At
this point, chip has been allocated and some fields have been initialized,
but it has not been stored anywhere, so it should be freed before leaving
the function.

A simplified version of the semantic match that finds the problem is as
follows: (http://coccinelle.lip6.fr)

// <smpl>
@r exists@
local idexpression x;
statement S;
identifier f1;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...x...+> }
x->f1
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mfd/88pm860x-i2c.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/88pm860x-i2c.c b/drivers/mfd/88pm860x-i2c.c
index 630f1b5..f93dd95 100644
--- a/drivers/mfd/88pm860x-i2c.c
+++ b/drivers/mfd/88pm860x-i2c.c
@@ -286,6 +286,7 @@ static int __devinit pm860x_probe(struct i2c_client *client,
 		ret = PTR_ERR(chip->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
 				ret);
+		kfree(chip);
 		return ret;
 	}
 	chip->client = client;

