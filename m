From: Domen Puncer <domen@coderock.org>
Date: Mon, 28 Jun 2004 14:33:12 +0000
Subject: [Kernel-janitors] Re: set_current_state
Message-Id: <20040628143312.GA24005@nd47>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24080436597609545=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040627223356.GA1653@masina>
In-Reply-To: <20040627223356.GA1653@masina>
To: kernel-janitors@vger.kernel.org

--===============24080436597609545==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 28/06/04 18:51 +0530, Anupam Kapoor wrote:
> hi,
> 
> i just checked with the latest sources and there are 417 entries with
> 'current->state'. is a blind search-replace to set_current_state ok ?

Yes, usualy.
Or maybe you should use __set_current_state (but do we really care that
much about performance before schedule()?).

Opinions?

--===============24080436597609545==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24080436597609545==--
