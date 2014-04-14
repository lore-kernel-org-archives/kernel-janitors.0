From: Andev <debiandev@gmail.com>
Date: Mon, 14 Apr 2014 18:58:45 +0000
Subject: Re: Help required for Compiling a staging driver
Message-Id: <CAJUuVQ4Bu8RBvfkP9kgBxFwiPu6khPYeEOtof8A8Bf9R+2EOzw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140414184618.GA13336@kroah.com>
In-Reply-To: <20140414184618.GA13336@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 14, 2014 at 2:47 PM, Kumar Gaurav
<kumargauravgupta3@gmail.com> wrote:

>
> What does it mean by full build? You mean compiling All modules? If yes then
> is there anyway to mark all module at once or i need to mark everything one
> by one (i use menuconfig)?
>

$ make defconfig
$ make localmodconfig
$ make -j4

Please read: http://www.kroah.com/lkn/
