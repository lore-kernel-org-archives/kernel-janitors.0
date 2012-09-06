From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 06 Sep 2012 16:09:11 +0000
Subject: [PATCH 3/10] drivers/media/radio/si4713-i2c.c: removes unnecessary semicolon
Message-Id: <1346947757-10481-4-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346947757-10481-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346947757-10481-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/radio/si4713-i2c.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff -u -p a/drivers/media/radio/si4713-i2c.c b/drivers/media/radio/si4713-i2c.c
--- a/drivers/media/radio/si4713-i2c.c
+++ b/drivers/media/radio/si4713-i2c.c
@@ -1009,7 +1009,7 @@ static int si4713_choose_econtrol_action
 
 	default:
 		rval = -EINVAL;
-	};
+	}
 
 	return rval;
 }
@@ -1081,7 +1081,7 @@ static int si4713_write_econtrol_string(
 	default:
 		rval = -EINVAL;
 		break;
-	};
+	}
 
 exit:
 	return rval;
@@ -1130,7 +1130,7 @@ static int si4713_write_econtrol_tune(st
 	default:
 		rval = -EINVAL;
 		goto unlock;
-	};
+	}
 
 	if (sdev->power_state)
 		rval = si4713_tx_tune_power(sdev, power, antcap);
@@ -1420,7 +1420,7 @@ static int si4713_read_econtrol_string(s
 	default:
 		rval = -EINVAL;
 		break;
-	};
+	}
 
 exit:
 	return rval;
@@ -1473,7 +1473,7 @@ static int si4713_read_econtrol_tune(str
 		break;
 	default:
 		rval = -EINVAL;
-	};
+	}
 
 unlock:
 	mutex_unlock(&sdev->mutex);
@@ -1698,7 +1698,7 @@ static int si4713_queryctrl(struct v4l2_
 	default:
 		rval = -EINVAL;
 		break;
-	};
+	}
 
 	return rval;
 }

