From: Udayan Singh <udayan.singh@gmail.com>
Date: Sun, 15 Jan 2006 15:31:05 +0000
Subject: [KJ] Audit return codes (and handle failure correctly) for
Message-Id: <d9a09df00601150731g4d65ab40ya62134fbd0a8cb22@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57708274337111032=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============57708274337111032==
Content-Type: multipart/alternative;
    boundary="----------=_1137339103-24489-475"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1137339103-24489-475
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi ,

I am trying to understand a point mentioned in ToDo list of KJ,

"Audit return codes (and handle failure correctly) for  " -- create_proc_*()
..

I had a look at the code (in fs/proc/*, linux kernel 2.6.14).

Clarifications that i needed :

Is it that the wherever create_proc_* functions are being called, it needs
to be looked into how is it handling a failure ?
OR
Within the function(s) create_proc_*, it needs to be looked into for the
error codes it is receiving while it is calling other functions and handle
them accordingly ?

I intend to understand the above mentioned requirement and then try to do
it. Would appreciate information on above.

Regards,
Udayan

------------=_1137339103-24489-475
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi ,<br>
<br>
I am trying to understand a point mentioned in ToDo list of KJ, <br>
<br>
&quot;Audit return codes (and handle failure correctly) for&nbsp; &quot; --=
 create_proc_*() ..<br>
<br>
I had a look at the code (in fs/proc/*, linux kernel 2.6.14).&nbsp; <br>
<br>
Clarifications that i needed :<br>
<br>
Is it that the wherever create_proc_* functions are being called, it
needs to be looked into how is it handling a failure ?&nbsp; <br>
OR <br>
Within the function(s) create_proc_*, it needs to be looked into for
the error codes it is receiving while it is calling other functions and
handle them accordingly ?<br>
<br>
I intend to understand the above mentioned requirement and then try to do i=
t. Would appreciate information on above. <br>
<br>
Regards,<br>
Udayan<br>
<br>

------------=_1137339103-24489-475--

--===============57708274337111032==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57708274337111032==--
