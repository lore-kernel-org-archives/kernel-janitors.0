From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Sat, 19 Jul 2014 09:23:35 +0000
Subject: Re: [PATCH 5/5] fs/ubifs/{sb,super}.c: drop negativity check on unsigned value
Message-Id: <1405761815.28207.15.camel@sauron.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405697725-23866-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405697725-23866-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dcb314@hotmail.com, adrian.hunter@intel.com

On Fri, 2014-07-18 at 18:35 +0300, Andrey Utkin wrote:
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80581
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>

Hi, thanks, but I already have a patch which does the same in the
linux-ubifs.git tree:

commit b793a8c8885d87d9867fb2dbfdc1ef7b5877d71b
Author: hujianyang <hujianyang@huawei.com>
Date:   Wed Jun 11 10:42:52 2014 +0800

    UBIFS: remove useless statements
   =20
    This patch removes useless and duplicate statements.
   =20
    Signed-off-by: hujianyang <hujianyang@huawei.com>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

--=20
Best Regards,
Artem Bityutskiy


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
