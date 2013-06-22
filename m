From: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Date: Sat, 22 Jun 2013 02:45:53 +0000
Subject: Re: [patch] ipw2x00: printing the wrong array in debug code
Message-Id: <CA++WF2NXrbHi4DN112QxAiGDtYuGL6MYcvbV-7R4opcpHeVuaA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130621122620.GC24059@elgon.mountain>
In-Reply-To: <20130621122620.GC24059@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 21 June 2013 05:26, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Smatch complains that this is a read past the end of the array.  It
> turns out we are printing the wrong array here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Looks fine, thanks.

Stanislav.
