From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Oct 2012 18:49:35 +0000
Subject: Re: How to automatically get subsystem name for a file?
Message-Id: <20121001184935.GP4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+MoWDrjiGQtBdr_n5TEwDJDv4pDyitKqHmruCy7-ur0GwKp0w@mail.gmail.com>
In-Reply-To: <CA+MoWDrjiGQtBdr_n5TEwDJDv4pDyitKqHmruCy7-ur0GwKp0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 01, 2012 at 06:57:44PM +0200, Peter Senna Tschudin wrote:
> I'm trying to figure it out how to automatically get the correct
> subsystem string for putting on the first line of the commit message /
> subject of the patch message. For example:
> 
> Subject: [PATCH 001/142] arch/x86: Replace memcpy with struct assignment
>                                        ^^^^^^^^^^
> arch/x86 is only the first two levels of directories from Kernel
> source. This may not be smart enough...
> 

You have to do it manually.  Here are the relevant lines from my
patch script.

git log --oneline $fullname | head -n 10
echo "Copy and paste one of these subjects?"
read unused

You should be reading through the patch manually anyway and the
reviewer needs to read it manually.  It's not like the 20 seconds
it takes to consider which prefix to use is a big deal.

regards,
dan carpenter

