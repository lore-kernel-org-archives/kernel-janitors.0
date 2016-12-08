From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2016 15:10:15 +0000
Subject: Re: [patch] parisc: perf: return -EFAULT on error
Message-Id: <20161208151014.GW8176@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161208113200.GC11382@elgon.mountain>
 <CAOmT4fTi+7r=1OJsumVC_+ET-NXcGjsZ5+t5ppm0eZZ2VeuF-A@mail.gmail.com>
In-Reply-To: <CAOmT4fTi+7r=1OJsumVC_+ET-NXcGjsZ5+t5ppm0eZZ2VeuF-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bojan prtvar <prtvar.b@gmail.com>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Dec 08, 2016 at 03:53:42PM +0100, bojan prtvar wrote:
> Hi Dan,
> 
> On Thu, Dec 8, 2016 at 12:32 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > -       if ((err = copy_from_user(&image_type, buf, sizeof(uint32_t))) != 0)
> > -               return err;
> 
> Why not delete err?

Gar... I'm sorry.  I'll resend.

regards,
dan carpenter

