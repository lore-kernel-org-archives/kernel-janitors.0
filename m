From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Aug 2013 07:17:05 +0000
Subject: Re: [PATCH] USBIP:stub_dev.c fixing string splitted into multiple line issue
Message-Id: <20130801071705.GK5002@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375292922-13724-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1375292922-13724-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 31, 2013 at 10:26:15PM +0200, Julia Lawall wrote:
> On Wed, 31 Jul 2013, Kumar Gaurav wrote:
> 
> > Fixed  String splitted into multiple line issue using macro
> 
> I'm not an expert on this kind of style issue, but I prefer strings that 
> look like strings.
> 

Yeah.  This patch makes the code more abstract and harder to
understand.

regards,
dan carpenter

