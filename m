From: Joe Perches <joe@perches.com>
Date: Sun, 03 May 2020 15:46:22 +0000
Subject: Re: [PATCH] checkpatch: add support for title acrosses three lines in commit id description
Message-Id: <83ef442fc90cbfce1d8566e43e9af2bd2089b4e1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200503123435.GD10332@udknight>
In-Reply-To: <20200503123435.GD10332@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang YanQing <udknight@gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>, Markus.Elfring@web.de, kernel-janitors@vger.kernel.org

On Sun, 2020-05-03 at 20:34 +0800, Wang YanQing wrote:
> The current GIT_COMMIT_ID will report error when the title in commit id
> description acrosses three lines, take changelog of commit 87b0f983f66f
> ("net: mscc: ocelot: fix untagged packet drops when enslaving to vlan
> aware bridge") as a example.

I think it's a diminishing returns problem.

What percentage of commits in the last 10000
has this issue?
