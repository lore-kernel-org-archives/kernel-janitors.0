From: Adam Ward <Adam.Ward.opensource@diasemi.com>
Date: Mon, 07 Dec 2020 17:08:14 +0000
Subject: RE: [bug report] regulator: da9121: Add device variant regmaps
Message-Id: <AM6PR10MB28077709482B54E7E9940E5FECCE0@AM6PR10MB2807.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8pP/pZAj6W7/YfP@mwanda>
In-Reply-To: <X8pP/pZAj6W7/YfP@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 4 Dec 2020 15:05, Dan Carpenter wrote:

>    818          const char *name;
>                 ^^^^^^^^^^^^^^^^

>    868          if (!config_match) {
>    869                  dev_err(chip->dev, "Device tree configuration '%s' does not
> match detected device.\n", name);
>                                                                                                                ^^^^
> "name" is never set.  What did you want it to be?

Ahh! Thought I'd removed that - thank you, another fine catch :-)

Regards,
Adam
