From: Dan Carpenter <error27@gmail.com>
Date: Tue, 19 May 2015 14:08:59 +0000
Subject: Re: Breaking lines in function headers
Message-Id: <CA+_b7DJ_o5Aij-+3U250XyOKhhpzB0EM33K3XRifMeFLP9zF_w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <555B3901.3090707@wimdewith.com>
In-Reply-To: <555B3901.3090707@wimdewith.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 19, 2015 at 4:22 PM, Wim de With <nauxuron@wimdewith.com> wrote:
> What is the correct way to break lines in a function header? The coding
> style guide is not very clear about it. For example:
>
> 1.
> static struct very_long_struct_name
> *do_something_interesting(struct *another_long_struct_name)
>
> 2.
> static struct very_long_struct_name *do_something_interesting(
>                                 struct *another_long_struct_name)
>
> Which one of these is the correct way to do it? I see the second one
> used more often, and the coding style guide states "Descendants are
> always substantially shorter than the parent and are placed
> substantially to the right. The same applies to function headers with a
> long argument list.", so I am inclined to say it is the correct way of
> doing it. But if it is, how many tabs should I use? How should I align
> the arguments if the list is longer, and I need more line breaks?

First of gmail always marks your emails as spam so I only see the
replies.

Both declaration formats are acceptable.

These days instead of "substantially to the right" most people
insist that they be aligned.  I think checkpatch.pl --strict enforces
this.

regards,
dan carpenter
