From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 13 Apr 2014 04:43:17 +0000
Subject: Re: Need Clarification about Whether i can change some Specific Staging Code
Message-Id: <20140413044317.GA15698@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <534A0341.1050303@gmail.com>
In-Reply-To: <534A0341.1050303@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Apr 13, 2014 at 08:53:45AM +0530, Kumar Gaurav wrote:
> Hi Greg,
> 
> I was checking drivers code to see which are still using semaphore. I 
> found some in staging. When i opened the code for upgrading that to 
> MUTEX i found a note. that says:
> 
>   *    NOTE TO LINUX KERNEL HACKERS:  DO NOT REFORMAT THIS CODE!
>   *
>   *    This is shared code between Digi's CVS archive and the
>   *    Linux Kernel sources.
>   *    Changing the source just for reformatting needlessly breaks
>   *    our CVS diff history.
>   *
>   *    Send any bug fixes/changes to:  Eng.Linux at digi dot com.
>   *    Thank you.
>   */
> 
> Involved codes are
> ./drivers/staging/dgap/dgap_tty.c
>   ./drivers/staging/dgnc/dgnc_tty.c
> 
> Please let me know if i can submit a patch against these files.

Yes you can, in fact, you can send a patch to remove those lines :)

greg k-h
