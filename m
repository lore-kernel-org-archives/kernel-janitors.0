From: Dan Carpenter <error27@gmail.com>
Date: Fri, 07 Jan 2011 06:05:58 +0000
Subject: Re: [patch] vga_switcheroo: comparing too few characters in
Message-Id: <20110107060558.GE1717@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110107051227.GD1717@bicker>
 <20110107053054.GA9057@p183.telecom.by>
In-Reply-To: <20110107053054.GA9057@p183.telecom.by>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>, Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 07, 2011 at 07:30:54AM +0200, Alexey Dobriyan wrote:
> On Fri, Jan 07, 2011 at 08:12:27AM +0300, Dan Carpenter wrote:
> > -	if (strncmp(usercmd, "MDIS", 3) = 0) {
> > +	if (strncmp(usercmd, "MDIS", 4) = 0) {
> 
> How about you NUL-terminate, and use strcmp().

I assume there is a reason for this userspace API.  Dave?

regards,
dan carpenter
