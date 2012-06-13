From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 13 Jun 2012 17:06:18 +0000
Subject: Re: [Q] Cleaning string whitespace trimming. Does it make any sense?
Message-Id: <CALF0-+WR++03J4g2BFaLJN+TWYgV2AYfXZr4MU7Q7OwjixEE5Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
In-Reply-To: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 13, 2012 at 4:23 AM, walter harms <wharms@bfs.de> wrote:
Hi Walter,

>
> as rule-of-the-thumb: just do it.

Thanks for this advice. I'm gonna do just that.

>
> Convenience functions like trim() are added add irregular intervals because
> they appear only if someone spots a pattern that he things is worth the effort.
> Older Code does not know about it, so changes are required through the whole
> code (look at patches from Julia Lawall, she has developed a tool to spot pattern).
>
> How does it look from a maintainers perspective ?
> 1. He can remove a function from your code and reduce what you have to maintain -> good
> 2. He has a special need and need its own code -> but at least you know about it now :)
>
> in short: you can make nothing wrong

Okey, thanks again.

Regards,
Ezequiel.
