From: Nick Andrew <nick@nick-andrew.net>
Date: Fri, 31 Oct 2008 13:45:34 +0000
Subject: Re: Confusion about unused variable warnings during kernel build.
Message-Id: <20081031134534.GB13606@mail.local.tull.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30810282321x4e54617dq5e7d273ac5ff131f@mail.gmail.com>
In-Reply-To: <ea11fea30810282321x4e54617dq5e7d273ac5ff131f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 31, 2008 at 07:23:04AM +0530, Manish Katiyar wrote:
> On Fri, Oct 31, 2008 at 12:42 AM, Marcin Slusarz
> <marcin.slusarz@gmail.com> wrote:
> > Check the definition of functions which "use" these variables.
> 
> I checked them and they are very much used. I can understand if they
> would have been in some #ifdef but that doesn't seem to be the case
> here.

I think the functions end up being #defined away into nothing,
in certain cases. In the first example you mentioned with
fs/lockd/svclock.c the vfs_lock_file function gets #defined as
"(-ENOLCK)" in include/linux/fs.h if CONFIG_FILE_LOCKING is not set,
so I guess that's how you configured your kernel.

Nick.
