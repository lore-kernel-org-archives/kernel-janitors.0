From: "Theodore Ts'o" <tytso@mit.edu>
Date: Sun, 28 Apr 2019 13:21:26 +0000
Subject: Re: [PATCH][next] unicode: fix dereference of a potentially null pointer
Message-Id: <20190428132126.GB24089@mit.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190426222237.13209-1-colin.king@canonical.com>
 <CAK7LNATC5b9yx79sF55hw1X9vZTJK8H+WsLRfy81_chZYRgTYw@mail.gmail.com>
 <85ef5mcrze.fsf@collabora.com>
In-Reply-To: <85ef5mcrze.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Olaf Weber <olaf@sgi.com>, Gabriel Krisman Bertazi <krisman@collabora.co.uk>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Colin King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Apr 28, 2019 at 07:02:45AM -0400, Gabriel Krisman Bertazi wrote:
> > On Sat, Apr 27, 2019 at 7:22 AM Colin King <colin.king@canonical.com> wrote:
> >>
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> The pointer 'tree' is deferenced when assigning pointer 'trie', however
> >> trie is being null checked a few lines later, so it could potentially
> >> be null. Fix the potential null pointer dereference by only dereferencing
> >> it after it has been null checked.
> >>
> >> Addresses-Coverity: ("Dereference before null check")
> >> Fixes: b08fcacaaaf4 ("unicode: introduce UTF-8 character database")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Acked-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> Ted, can you pick this up directly for now?

Ack, I've merged it into the the patch "unicode: introduce UTF-8
character database".

						- Ted
