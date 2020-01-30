From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2020 10:00:09 +0000
Subject: Re: Open tasks?
Message-Id: <20200130100009.GD1778@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHM57JSf8XXOKzyjBWD3m7PPUaEC7Oa_XYyOjbcEfJj5Swxu7Q@mail.gmail.com>
In-Reply-To: <CAHM57JSf8XXOKzyjBWD3m7PPUaEC7Oa_XYyOjbcEfJj5Swxu7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jan 20, 2020 at 08:36:32PM -0800, Raymond Deng wrote:
> Hi, are there open tasks for reasonably new people to do? Thanks.

The new hotest idea is to sign up for te syzbot mailing list and fix
bugs.

For example:
https://syzkaller.appspot.com/bug?extid=C37a14770d51a085a520

It has a c reproducer.  It has been bisected but if it's a race
condition, the git bisection could be suspect.  It affects v5.5-rc7
(It's in the dmesg, you need the version information for the lines to
match up).

My first thought was that it is an integer overflow but I can't see how
that would be possible.  Smatch said it was possible, but Smatch assumed
that we had set vc->vc_cols to an invalid number before the start.
Btw, using the Smatch `smdb.py where vc_cols` command is super helpful
for debugging these bugs.

Then my next thought was that it is a race condition but we're always
holding the console_lock() so I can't see how that works either...
Again for these things `smdb.py` really helps for examining the callers.
I'm working on recording when the caller is holding a lock but it's a
bit complicated and I'm not ready to push that code yet.

It's a mystery.

regards,
dan carpenter
