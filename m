From: Grant Edwards <grant.edwards@comtrol.com>
Date: Tue, 04 Oct 2011 16:16:28 +0000
Subject: Re: FW: puzzle for puzzle lovers
Message-Id: <20111004161627.GA10694@comtrol.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111004072631.GA18470@longonot.mountain>
In-Reply-To: <20111004072631.GA18470@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> Subject: puzzle for puzzle lovers
> Date: Tuesday 04 October 2011
> From: Dan Carpenter <dan.carpenter@oracle.com>
> To: kernel-janitors@vger.kernel.org
> 
> Here is something that might amuse someone.
> 
> Smatch reports a read past the end of the array in rocket.c
> drivers/tty/rocket.c +2168 init_ISA(77)
> 	error: buffer overflow calling init_r_port. param 0. 7 >= 4
> 
> drivers/tty/rocket.c
>    657          init_completion(&info->close_wait);
>    658          info->flags &= ~ROCKET_MODE_MASK;
>    659          switch (pc104[board][line]) {
>    660          case 422:
>    661                  info->flags |= ROCKET_MODE_RS422;
>    662                  break;
> 
> pc104[] is a 4 element array.
> 
> board comes from for loop in rp_init().
> 
>   2315          for (i = 0; i < NUM_BOARDS; i++) {
>   2316                  if (init_ISA(i))
>   2317                          isa_boards_found++;
>   2318          }
> 
> NUM_BOARDS is is 8, so according to Smatch "board" can be 7

At that point in the code, 'board' can only be 0-3.  The init_ISA(i)
function will return immediately if isa_io_addr[i] is 0. isa_io_addr[]
is a static 8-element array and only the first 4 elements are ever
assigned to. Therefore, isa_io_addr[4] is guaranteed to be 0, and the
loop above is never called with 'board' greater than 3.

> and no one knows what line is.

'line' is the serial port index within that board (e.g. 0-7 on a
8-port board, 0-31 on a 32-port board).

> Weird huh?

pc104 is a 4-element array of pointers.  Those pointers point to
8-element arrays.  'board' can be 0-3, and 'line' can be 0-7.

The problem is that there are 32-port ISA boards, so I think pc104_1
through pc104_4 should be 32-element arrays.  I suspect this hasn't
caused any failures because the flags set based on pc104[board][line]
are only used in the case of PC104 boards, and PC104 boards never have
more than 8 ports.

IOW, for boards with more than 8 ports, there is a read-past-end-of-array
but the result isn't used.  Hmm -- there may be one case where the
bogus result _is_ used but it would take some work to figure out if
that happens or not.  It would be better to just change pc104_1
through pc104_4 from 8-element arrays to 32-element arrays.

> But the code is ancient from before the git era so no one knows what
> it's supposed to do.

I can explain "it" to you if you specify to what "it" refers.

> Unless you are clever enough to solve this mystery.

If it would make people happy, feel free to make pc104[] a
MAX_NUMBEROF_BOARDS sized array.  It's not possible to configure more
than 4 ISA boards, but if the objective is to make a static code
analyzer happy, then go ahead.

> This code gets run during init so presumably it got tested often
> ten years ago and it works.

Diclaimer: Comtrol offers no support for the in-tree driver.  The
driver we officially support is at ftp://ftp.comtrol.com/html/default.htm

-- 
Grant Edwards
grant.edwards@comtrol.com
