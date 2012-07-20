From: Jiri Slaby <jslaby@suse.cz>
Date: Fri, 20 Jul 2012 21:32:30 +0000
Subject: Re: [patch] tty: handle NULL parameters in free_tty_struct()
Message-Id: <5009CE6E.4080006@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120720070634.GC11710@elgon.mountain> <20120720104831.47cb4237@pyramind.ukuu.org.uk>
In-Reply-To: <20120720104831.47cb4237@pyramind.ukuu.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/20/2012 11:48 AM, Alan Cox wrote:
> On Fri, 20 Jul 2012 10:06:34 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
>> We sometimes pass NULL pointers to free_tty_struct().  One example where
>> it can happen is in the error handling code in pty_common_install().
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Alan Cox <alan@linux.intel.com>
> 
> We probably shouldn't be passing NULLs there but making
> free_tty_struct(NULL) a no-op matches the kfree and other behaviours and
> is robust.

Yes, this was unintended. Good catch, Dan.

thanks,
-- 
js
suse labs
