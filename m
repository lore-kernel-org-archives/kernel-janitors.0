From: Anton Vorontsov <anton@enomsg.org>
Date: Mon, 07 Jan 2013 06:53:21 +0000
Subject: Re: [PATCH] drivers/power/88pm860x_battery.c: eliminate possible references to released resources
Message-Id: <20130107065321.GA31407@lizard.gateway.2wire.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354986995-2324-1-git-send-email-Julia.Lawall@lip6.fr>
 <20130106050953.GH6919@lizard.sbx05280.losalca.wayport.net>
 <alpine.DEB.2.02.1301060941400.2070@localhost6.localdomain6>
 <20130106211649.GA26928@lizard.sbx05280.losalca.wayport.net>
 <20130107064223.GR7247@mwanda>
In-Reply-To: <20130107064223.GR7247@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

On Mon, Jan 07, 2013 at 09:42:23AM +0300, Dan Carpenter wrote:
> On Sun, Jan 06, 2013 at 01:16:50PM -0800, Anton Vorontsov wrote:
> > The patch is whitespace-damaged (for some reason there are two spaces in
> > the beginning of each non-change line). I repeated changes manually, but
> > you might want to fix your mail/patch setup anyway. :)
> > 
> 
> It may be something on your end, the patch applies fine for me.

I just looked into Julia's email headers, and it says:

  Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

flowed? for the patch? :) That's not right.

Documentation/email-clients.txt says:

  Don't send patches with "format=flowed".  This can cause unexpected
  and unwanted line breaks.

:-P

As for why it applied fine for you, your mailer probably automatically
decodes the content, but I apply mbox file directly. (If I '<ESC>-C' the
email in mutt, then it also applies for me, but I normally don't do that.)

Anton
