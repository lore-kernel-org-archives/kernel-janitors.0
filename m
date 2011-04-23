From: Dan Carpenter <error27@gmail.com>
Date: Sat, 23 Apr 2011 08:38:34 +0000
Subject: Re: Getting started as a janitor
Message-Id: <BANLkTikMtSes3TOb8MtnXiLfE2xfTNQtWA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BANLkTi=1H5-RpvfWbfCMQBn4EktZOWvdCw@mail.gmail.com>
In-Reply-To: <BANLkTi=1H5-RpvfWbfCMQBn4EktZOWvdCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/22/11, Manuel Mejia <me@manuelmejia.com> wrote:
> Hello All,
>
> My name is Manuel. I've been itching to get some more experience
> working with a lower level language (C/C++) since I have developed
> mainly in higher level languages like PHP, C#, Java, and C++/Qt.I
> thought the best way would be to contribute to open source as I use it
> all the time. I was wondering if someone out there could take the time
> to guide me a bit on how to get started with some of the tasks for
> kernel janitors.
>

Kernel coding isn't really a good place to start learning C.  It's
normally assumed that you are proficient in C already when you
start sending patches.

Mostly these days kernel janitors is just static checker stuff and
auditing code.  Like for example, auditing the error handling for
copy_to/from_user() calls.  The other thing is you could do if you
wanted would be to fix up a staging driver.  But mostly those
patches get sent to the staging list and not to kernel janitors.

regards,
dan carpenter
