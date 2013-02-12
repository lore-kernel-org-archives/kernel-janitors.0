From: Mark Ruijter <mruijter@gmail.com>
Date: Tue, 12 Feb 2013 10:09:00 +0000
Subject: Re: Preparing btier for kernel inclusion
Message-Id: <511A14BC.4000601@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5119FBC9.7030308@gmail.com>
In-Reply-To: <5119FBC9.7030308@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi Dan,

Thanks for your elaborate and fast response.
I will change things as suggested and get back afterwards.

On quick question about indenting:
Is there a set of options to indent that can produce indented code that 
is acceptable?
Like : indent -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1 *.c

Or is manual labour a requirement? ;-)

Best regards,

Mark

--
On 02/12/2013 10:47 AM, Dan Carpenter wrote:
> This is staging quality code.  (Not very good).  The staging tree is
> closed for the 3.9 window so it couldn't make it in until 3.10.
>
> *) Clean up the indenting.
> *) Run checkpatch.pl over this and fix the warnings.
> *) Don't include .c files into other .c files.
> *) Get rid of homemade print macros like TIERERR().  Use dev_err()
>     or pr_err().
> *) Delete all compat code with older kernels like
> 	#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,0,0)
> *) Change Yoda code to the if (NULL = odinfo) to normal format
> 	if (!odinfo)
> 		return -ENOMEM;
>     Or "if (NULL != dev->backdev[0]->blocklist)" should be:
> 	if (dev->backdev[0]->blocklist)
> 		memcpy( ...
> *) Run Sparse and Smatch over the code.  This should complain about
>     some poor error handling.  For example, printing "no memory"
>     followed by a dereference instead of actual error handling.  Or
>     in the ioctl() it returns with the lock held.
>
> *) Make magic numbers a define.
> 	/* Allow max 24 devices to be configured */
> 	devicenames = kmalloc(sizeof(char) * 26, GFP_KERNEL);
>
> 	for (count = 0; count <= 25; count++) {
> 		devicenames[count] = 97 + count;
> 	}
>
>     Where does the 97 come from?  Also it's hella messy to use
>     24, 25, and 26!  The for loop should be written in the normal
>     way:
>
> 	#define MAX_BTEIR_DEVS 26
>
> 	for (i = 0; i < MAX_BTEIR_DEVS; i++) {
>
>     Btw, use "i" instead of "count" for the iterator.  Use "count"
>     for counting.
>
>     Some of the magic numbers are just wrong:
> 	res = snprintf(buf, 1023, "%s\n", msg);
>     1023 should have been PAGE_SIZE.  If the size argument to
>     snprintf() is non-zero then snprintf() adds a NUL terminator.
>     No one ever creates a 1023 char buffer.  Also the return value
>     is the number of bytes that would have been printed if there
>     were enough space (not counting the NUL terminator).  Consider
>     using scnprintf().
>
> *) Use normal kernel style comments.
> 	/* single line comment */
>
> 	/*
> 	 * Multi line
> 	 * comment.
> 	 */
>
> *) Some of functions could use more comments.  What does
>     allocated_on_device() return?  I would have assumed from the name
>     that it returns a bool, but actually it returns a u64.
>
> *) It scares me that when list_for_each_safe() is used
>     unnecessarily.  A lot of people assume it has to do with locking
>     but it doesn't.  It's for when you remove a list item.  This is
>     wrong:
>
> 	list_for_each_safe(pos, q, &device_list) {
> 		count++;
> 	}
>
> *) Put a blank line between declarations and code.
>
> *) Use temp variables to make lines shorter:
>
> -	dev->backdev[count]->bitlistsize > -		dev->backdev[count]->devmagic->bitlistsize;
>
> +	back = dev->backdev[count];
> +	back->bitlistsize = back->devmagic->bitlistsize;
>
> *) Never return -1 as a error code.  Return proper error codes at
>     every level.
>
> *) The TIER_DEREGISTER ioctl takes a kernel pointer from user space
>     which is a bug.  It should be doing copy_from_user().
>
> There are a lot of other messy things about this code, but that
> should be enough to get started.
>
> My advice is that people will take you a lot more seriously if you
> clean it up and make a good first impression.  The block layer
> people are crotchety.
>
> Also, when you send patches for review, send it as a patch which can
> be reviewed without leaving the email client.  That way we can put
> comments inline.
>
> regards,
> dan carpenter
>

