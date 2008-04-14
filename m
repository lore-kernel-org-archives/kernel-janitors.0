From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 14 Apr 2008 20:25:43 +0000
Subject: Re: cli()/sti() removal
Message-Id: <919fe2b30804141325r47ae47edi316a03a0d0d68c70@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
In-Reply-To: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 14, 2008 at 3:59 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
>
> On Mon, 14 Apr 2008 15:38:27 -0400 M. Asselstine wrote:
>
>  > Looking at Documentation/cli-sti-removal.txt and grepping for these
>  > macros in the kernel tree reveal that things are close to allowing
>  > this task to be completed. I would like to propose that the remainder
>  > of this work be completed, cleaning up documentation and code related
>  > to this deprecation. I am willing to do the work but just wanted to
>  > put a feeler out there to determine if there is any reason not to
>  > proceed. I also wanted to make sure there wasn't anyone else doing
>  > this already.
>
>  Hi,
>
>  The biggest issue is that this isn't a simple grep for and then
>  substitute new strings for the old ones.  If that's all it was,
>  it would have been completed long ago.
>
>  Some actual thought/design has to be done on several of these in
>  order to do the locking correctly in all possible contexts, so if
>  you are up for that, go ahead.  I don't think that anyone else is
>  doing this just now.
>

Yes I realize that this is more then a simple replacement job and that
it will involve some thought. I think with the small numbers of these
remaining I can devote the necessary time and thought. If not I can at
minimum get a few steps closer to getting rid of these, even if I
manage to get rid of only one or two.

Mark

>  ---
>  ~Randy
>
