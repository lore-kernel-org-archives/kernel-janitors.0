From: Walter Harms <wharms@bfs.de>
Date: Tue, 10 Mar 2020 17:57:18 +0000
Subject: AW: [PATCH] bfs: prevent underflow in bfs_find_entry()
Message-Id: <fabccce3c25444bbb5aa51f8c08e9865@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200307060808.6nfyqnp2woq7d3cv@kili.mountain>
 <ba294b1d861142ca8f7b204356009dd0@bfs.de>,<20200310090644.GA11583@kadam>
In-Reply-To: <20200310090644.GA11583@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


________________________________________
Von: Dan Carpenter <dan.carpenter@oracle.com>
Gesendet: Dienstag, 10. M=E4rz 2020 10:06
An: Walter Harms
Cc: Tigran A. Aivazian; linux-kernel@vger.kernel.org; kernel-janitors@vger.=
kernel.org
Betreff: Re: [PATCH] bfs: prevent underflow in bfs_find_entry()

On Mon, Mar 09, 2020 at 08:40:28AM +0000, Walter Harms wrote:
> hi Dan,
> the namelen usage is fishy. It goes into bfs_namecmp()
> where it is checked for namelen < BFS_NAMELEN, leaving
> only the case =3D=3D.

The rule in bfs_namecmp() is that the name has to be NUL terminated if
there is enough space.

that raises the question why is there a len paramter in the first place.
Surely the writer can make sure that there is always a NUL terminated
string, then it would be possible the use a simple strcmp() and the
range check is useless and can be removed.

seems a question for the maintainer.

re,
 wh
