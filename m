From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Oct 2015 15:16:07 +0000
Subject: Re: [patch] mfd: 64 bit bug in bxtwc_val_store()
Message-Id: <20151001151607.GG7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150928095636.GB11367@mwanda>
In-Reply-To: <20150928095636.GB11367@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 01, 2015 at 06:13:31PM +0300, Dan Carpenter wrote:
> I looked at the subjects to every other patch to that file and I
> followed the same pattern.

This is literally a part of my kpatch.sh script:

git log --oneline $fullname | head -n 10
echo "Copy and paste one of these subjects?"
read unused

regards,
dan carpenter

