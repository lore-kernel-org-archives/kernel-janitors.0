From: bojan prtvar <prtvar.b@gmail.com>
Date: Thu, 08 Dec 2016 14:53:42 +0000
Subject: Re: [patch] parisc: perf: return -EFAULT on error
Message-Id: <CAOmT4fTi+7r=1OJsumVC_+ET-NXcGjsZ5+t5ppm0eZZ2VeuF-A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161208113200.GC11382@elgon.mountain>
In-Reply-To: <20161208113200.GC11382@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Thu, Dec 8, 2016 at 12:32 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> -       if ((err = copy_from_user(&image_type, buf, sizeof(uint32_t))) != 0)
> -               return err;

Why not delete err?

Regards,
Bojan
