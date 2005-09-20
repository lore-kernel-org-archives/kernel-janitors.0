From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 20 Sep 2005 21:57:38 +0000
Subject: Re: [KJ] [PATCH] specialix: eliminate deprecated check_region() call
Message-Id: <20050920220324.GB22839@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44419073171413803=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <25465C7B-EEA6-4184-869C-A43AB6079D2F@gmail.com>
In-Reply-To: <25465C7B-EEA6-4184-869C-A43AB6079D2F@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============44419073171413803==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 20, 2005 at 10:09:32PM +0100, Christoph Hellwig wrote:
> Better just kill these useless wrapper completely.  As in the example
> patch below: ;-)

You know what? Added to -kj. ;-)

[PATCH] specialix: check_region/request_region related cleanups

* Remove trivial wrappers to check_region(), request_region(),
  release_region().
* Fix error codes of probe routine.
* Switch deprecated check_region() to request_region().


--===============44419073171413803==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44419073171413803==--
