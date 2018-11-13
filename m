From: Dominique Martinet <asmadeus@codewreck.org>
Date: Tue, 13 Nov 2018 13:08:31 +0000
Subject: Re: [PATCH] net/9p: include trans_common.h to fix missing prototype warning.
Message-Id: <20181113130831.GA8673@nautica>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181113055324.GB5116@nautica>
 <b1c4df8f21689b10d451c28fe38e860722d20e71.1542089696.git.dato@net.com.org.es>
In-Reply-To: <b1c4df8f21689b10d451c28fe38e860722d20e71.1542089696.git.dato@net.com.org.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Adeodato =?utf-8?B?U2ltw7M=?= <dato@net.com.org.es>
Cc: Eric Van Hensbergen <ericvh@gmail.com>, v9fs-developer@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Adeodato Simó wrote on Tue, Nov 13, 2018:
> This silences -Wmissing-prototypes when defining p9_release_pages.
> 
> Signed-off-by: Adeodato Simó <dato@net.com.org.es>
> ---
>  net/9p/trans_common.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> It was suggested in the kernel-janitors mailing list that silencing
> -Wmissing-prototypes would make for a worthy cause.
> 
> https://www.spinics.net/lists/linux-kernel-janitors/msg43981.html
> 
> Resending w/ Cc: linux-kernel as requested by Dominique.

Great, pushed to my for-next branch, it'll probably get in there today
or tomorrow.

Thanks!
-- 
Dominique
