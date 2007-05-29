From: "Arnaldo Carvalho de Melo" <acme@ghostprotocols.net>
Date: Tue, 29 May 2007 15:28:47 +0000
Subject: Re: [KJ] setting fops member pointers to NULL?
Message-Id: <39e6f6c70705290828h5bf4a666v64bb7b99d821ffb1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705290526590.24445@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/29/07, John Anthony Kazos Jr. <jakj@j-a-k-j.com> wrote:
> > > > >   is there any rationale for setting a member of the file_operations
> > > > > structure explicitly to NULL as opposed to leaving it initialized?  i
> > > > > would think that's the default just based on the rules for C
> > > > > initialization, but i just wanted to make sure since i see it done
> > > > > every so often and wonder if there's something tricky going on that i
> > > > > don't know about.
> > > > >
> > > > > rday
> > > > >
> > > > >
> > > > Actually, C doesn't really care ... if you declare something, but don't
> > > > initialize it explicitly,
> > > > it will be filled with some random value (probably whatever was at the
> > > > given memory address
> > > > before C gave it to your var).
> > >
> > > Nope. If it is a global variable and it is left uninitialized it
> > > will be put into the .bss section and thus set to zero at program
> > > start.
> > >
> > > If you use named initializers in struct initializations, no matter
> > > where, the uninitialized members will be set to zero too.
> >
> > that's the understanding i had, so setting those global member fields
> > to NULL in various fops structures is really redundant.  doesn't hurt
> > anything, of course.
>
> Well, it does increase the on-disk image size. Like when code uses
> THIS_MODULE but is compiled built-in. But there're not many people who are
> going to really be interested in adding an ifdef to save that few bytes,
> unfortunately.

Yes, it used to be like that, but:

[acme@filo c_snippets]$ cat static.c
static int zero;

int main(void)
{
        printf("zero=%d\n", zero);
}
[acme@filo c_snippets]$ size static
   text    data     bss     dec     hex filename
   1005     252      12    1269     4f5 static
[acme@filo c_snippets]$

[acme@filo c_snippets]$ cat static.c
static int zero = 0;

int main(void)
{
        printf("zero=%d\n", zero);
}
[acme@filo c_snippets]$ size static
   text    data     bss     dec     hex filename
   1005     252      12    1269     4f5 static
[acme@filo c_snippets]$


So at least this version of gcc:

[acme@filo c_snippets]$ gcc --version
gcc (GCC) 4.1.2 20070502 (Red Hat 4.1.2-12)

Seems to be smart enough about moving explicitily zero initialized
globals to .bss, see what happens if it is initialized to !zero:

[acme@filo c_snippets]$ cat static.c
static int zero = 1;

int main(void)
{
        printf("zero=%d\n", zero);
}
[acme@filo c_snippets]$ size static
   text    data     bss     dec     hex filename
   1005     256       8    1269     4f5 static
[acme@filo c_snippets]$

See the .bss size? 4 bytes less, and .data is 4 bytes bigger.

Even tho gcc now does this for us it is a quite common idiom not to
initialize to zero if it is a global.

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
