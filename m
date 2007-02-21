From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Wed, 21 Feb 2007 12:02:11 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <82faac5b0702210402n6eaea312pfad093290975b422@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day people

On 2/21/07, Milind Choudhary <milindchoudhary@gmail.com> wrote:
> On 2/21/07, Richard Knutsson <ricknu-0@student.ltu.se> wrote:
> I mean if somebody blindly passes a value greater than BITS_PER_LONG
> [on architectures where long & long long aren't of same size]
> gcc would complain with
> :warning: left shift count >= width of type
> so they will backtrack & come to see whats cooking inside BIT
> & on the very next line they notice that there is LLBIT
> which they can use & live happily ever after.

Sounds fine, but if you want to wrap it, wouldn't it just be easier to do

#define BIT(n) (1<<(n%(sizeof(n) * 8)))

and have it all done automaticly ?

Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
