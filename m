From: Dan Carpenter <error27@gmail.com>
Date: Thu, 25 Nov 2010 10:04:02 +0000
Subject: Re: [PATCH] Fix sparse message rtl8192u
Message-Id: <20101125100402.GU1522@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290634903.4ced8697b0603@webmail.aliceadsl.fr>
In-Reply-To: <1290634903.4ced8697b0603@webmail.aliceadsl.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Nov 25, 2010 at 10:39:48AM +0100, david chosrova wrote:
> Hello,
> 
> Ok I'll check this out and send back the patch.
> 

You'll have to remove the ifdef from the dot11d.h file as well.

The ENABLE_DOT11D is the stuff which limits the radio frequencies based
on the country.  It's always defined in this driver.  If you wanted
to remove those ifdefs completely that would be great too.

regards,
dan carpenter

