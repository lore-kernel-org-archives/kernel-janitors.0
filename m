From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 May 2020 08:35:05 +0000
Subject: Re: question about lists
Message-Id: <20200505083505.GY2014@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.2005032308500.2533@hadrien>
In-Reply-To: <alpine.DEB.2.21.2005032308500.2533@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, May 04, 2020 at 09:41:21PM +0200, Christophe JAILLET wrote:
> =A0=A0 - in your example, before commit f52c380a48f52, it was allocated w=
ith
> kmalloc, so it was maybe to avoid a really unlikely '__list_add_valid'
> failure. Now that it is kzalloc'ed, this can not happen anymore.

No, it was never possible to get a __list_add_valid() failure.  The list
you're adding to has to be initialized, but the list item that doesn't.
In __list_add_valid() the "new" is "&entry_obj->list" which is an offset
into the entry_obj object.

regards,
dan carpenter
