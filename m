From: Joe Perches <joe@perches.com>
Date: Mon, 31 Dec 2018 09:07:24 +0000
Subject: Re: [PATCH] NFC: st95hf: clean up indentation, add in missing tab on return statement
Message-Id: <9de7579ee09f4b1724201c7d7655c539e0a35868.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181230133801.7237-1-colin.king@canonical.com>
In-Reply-To: <20181230133801.7237-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Samuel Ortiz <sameo@linux.intel.com>, Daniel Mack <daniel@zonque.org>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2018-12-30 at 13:38 +0000, Colin King wrote:
> A return statement is not indented enough, fix this by adding the
> missing tab.
[]
> diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
[]
> @@ -672,7 +672,7 @@ static int st95hf_error_handling(struct st95hf_context *stcontext,
>  			result = -ETIMEDOUT;
>  		else
>  			result = -EIO;
> -	return  result;
> +		return  result;
>  	}
>  
>  	/* Check for CRC err only if CRC is present in the tag response */

trivia: this might read better using direct returns

 drivers/nfc/st95hf/core.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 2b26f762fbc3..227b5f6dc26f 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -662,17 +662,15 @@ static int st95hf_error_handling(struct st95hf_context *stcontext,
 				 struct sk_buff *skb_resp,
 				 int res_len)
 {
-	int result = 0;
 	unsigned char error_byte;
 	struct device *dev = &stcontext->nfcdev->dev;
 
 	/* First check ST95HF specific error */
 	if (skb_resp->data[0] & ST95HF_ERR_MASK) {
 		if (skb_resp->data[0] = ST95HF_TIMEOUT_ERROR)
-			result = -ETIMEDOUT;
+			return -ETIMEDOUT;
 		else
-			result = -EIO;
-	return  result;
+			return -EIO;
 	}
 
 	/* Check for CRC err only if CRC is present in the tag response */
@@ -684,7 +682,7 @@ static int st95hf_error_handling(struct st95hf_context *stcontext,
 				/* CRC error occurred */
 				dev_err(dev, "CRC error, byte received = 0x%x\n",
 					error_byte);
-				result = -EIO;
+				return -EIO;
 			}
 		}
 		break;
@@ -695,12 +693,12 @@ static int st95hf_error_handling(struct st95hf_context *stcontext,
 			/* CRC error occurred */
 			dev_err(dev, "CRC error, byte received = 0x%x\n",
 				error_byte);
-			result = -EIO;
+			return -EIO;
 		}
 		break;
 	}
 
-	return result;
+	return 0;
 }
 
 static int st95hf_response_handler(struct st95hf_context *stcontext,
