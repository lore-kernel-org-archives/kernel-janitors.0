From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Mon, 30 Oct 2006 12:07:55 +0000
Subject: Re: [KJ] [PATCH] cleaning of HANDLE_STACK definition
Message-Id: <82faac5b0610300407h61110f41j47ae2576c893ee91@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
In-Reply-To: <20061029191459.92665.qmail@web90313.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day all

On 10/30/06, Amit Choudhary <amit2030@yahoo.com> wrote:

>
> There are couple of good reasons for using a do - while block in a macro having multiple
> statements.

While you are spot on here and that explains what the code did before
the patch, I think the point that Matthew Wilcox was getting at is
that _after_ this patch the "do { } while (0)", now apears to wrap a
_single_ "while (cond) { }" statement, making it surperflous.

Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
