From: Joe Perches <joe@perches.com>
Date: Fri, 10 Jan 2020 06:26:12 +0000
Subject: Re: [PATCH] regulator: mp8859: tidy up white space in probe
Message-Id: <845b26cae6396b50f78df45504a6014780b1d3a1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110055252.rvelu4ysvoxsbmlg@kili.mountain>
In-Reply-To: <20200110055252.rvelu4ysvoxsbmlg@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>, Markus Reichl <m.reichl@fivetechno.de>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2020-01-10 at 08:52 +0300, Dan Carpenter wrote:
> drivers/regulator/mp8859.c

I suggest also removing the blank line before this
block and adding a blank line after...
---
 drivers/regulator/mp8859.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/mp8859.c b/drivers/regulator/mp8859.c
index e804a5..87986d 100644
--- a/drivers/regulator/mp8859.c
+++ b/drivers/regulator/mp8859.c
@@ -118,13 +118,13 @@ static int mp8859_i2c_probe(struct i2c_client *i2c)
 	}
 	rdev = devm_regulator_register(&i2c->dev, &mp8859_regulators[0],
 					&config);
-
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
 		dev_err(&i2c->dev, "failed to register %s: %d\n",
 			mp8859_regulators[0].name, ret);
-			return ret;
-		}
+		return ret;
+	}
+
 	return 0;
 }
 
