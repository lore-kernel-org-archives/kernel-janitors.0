From: Dan Carpenter <error27@gmail.com>
Date: Sat, 01 Jan 2011 09:00:54 +0000
Subject: Re: [PATCH 1/2] staging: keucr: Use memcmp() instaed of custom
Message-Id: <20110101090053.GG1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1293823712-6273-2-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1293823712-6273-2-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Dec 31, 2010 at 12:26:00PM -0800, Joe Perches wrote:
> On Fri, 2010-12-31 at 20:28 +0100, Javier Martinez Canillas wrote:
> 	if (!(!memcmp(redundant+0x0D, EccBuf, 3) &&
> 	      !memcmp(redundant+0x08, EccBuf+0x03, 3)))
                              ^^^          ^^^

Also we should add spaces around the '+' character.  But this is dead
code anyway so let's just merge it.

regards,
dan carpenter
