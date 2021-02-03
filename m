From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Feb 2021 20:05:29 +0000
Subject: Re: [PATCH] misc: bcm-vk: Fix a couple error codes in probe()
Message-Id: <20210203200529.GH20820@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBpyEbmz00rjvT9S@mwanda>
 <55880105-a097-0268-de54-478d7dbae084@broadcom.com>
In-Reply-To: <55880105-a097-0268-de54-478d7dbae084@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Branden <scott.branden@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Desmond Yan <desmond.yan@broadcom.com>, Olof Johansson <olof@lixom.net>, James Hu <james.hu@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Feb 03, 2021 at 11:15:35AM -0800, Scott Branden wrote:
> Thanks Dan,
> 
> On 2021-02-03 6:42 a.m., Dan Carpenter wrote:
> > These errors should return negative error codes instead of returning
> > success.
> Do you have a script running to report such issues or just manually reviewing
> to find such paths?

Yeah.  This is a new Smatch check.  The heuristic is this:

	<-- ret is not set within 3 lines of the goto
	goto label;  <-- we hit a goto


	return 0;  <-- success path right before the cleanup block

label:	<-- labels
	return ret;  <-- This return has to sometimes returns negatives

regards,
dan carpenter
