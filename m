From: matt mooney <mfmooney@gmail.com>
Date: Fri, 08 Oct 2010 07:16:35 +0000
Subject: Re: [PATCH 00/33] Staging: Fixed <module-objs> to <module>-y
Message-Id: <AANLkTinynZj9bYFAyfRTF2uopmLe6Ls4YGdZPqCAJTpR@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTi=Hc2eWzOQ_xKBYsqfwkkiKGU0v42jUhLQ8K7dU@mail.gmail.com>
In-Reply-To: <AANLkTi=Hc2eWzOQ_xKBYsqfwkkiKGU0v42jUhLQ8K7dU@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: T Dent <tdent48227@gmail.com>
Cc: greg@kroah.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Thu, Oct 7, 2010 at 6:35 PM, T Dent <tdent48227@gmail.com> wrote:
> I patch against the next-20101006 tree.
>
> The patch series replace use of <module>-objs with <module>-y in the
> staging directory.

Commit messages are written in the present tense. You happen to be
using two different tenses within the commit message, which is truly
odd.  And why did you not split apart those atrocious statements with
the infinite column width?

This patch series adds little benefit.  As Sam has suggested, a more
general cleanup would be a better goal, and staging is an area that
needs extra attention some of which has already been pointed out in
other emails.

-mfm

-- 
GPG-Key: 9AFE00EA
