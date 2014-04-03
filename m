From: bojan prtvar <prtvar.b@gmail.com>
Date: Thu, 03 Apr 2014 15:40:25 +0000
Subject: Re: [PATCH] staging: vme: Fix a small coding style issue in vme_user.c
Message-Id: <CAOmT4fRZGvUgTC56BX7mONE8MrLufaatLdXyfw-nQahHAcC5Jw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1396477450-5354-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1396477450-5354-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 3, 2014 at 5:14 PM, walter harms <wharms@bfs.de> wrote:

> beside style:
> that sprint looks like as it could be replaced with a
>  name="bus/vme/m%%d"
>
> any takers ?
>
> re,
>  wh
>

Hi Walter,

I guess you mean something like this? Please review carefully if I got
right "%%d" intent.
Now a basic question. How to submit this properly? As a v2 patch with
both changes taken or as a two-patch serie?



diff --git a/drivers/staging/vme/devices/vme_user.c
b/drivers/staging/vme/devices/vme_user.c
index 481192a..5fa7f83 100644
--- a/drivers/staging/vme/devices/vme_user.c
+++ b/drivers/staging/vme/devices/vme_user.c
@@ -684,7 +684,7 @@ static int vme_user_match(struct vme_dev *vdev)
 static int vme_user_probe(struct vme_dev *vdev)
 {
        int i, err;
-       char name[12];
+       char *name;

        /* Save pointer to the bridge device */
        if (vme_user_bridge != NULL) {
@@ -794,13 +794,13 @@ static int vme_user_probe(struct vme_dev *vdev)

                switch (type[i]) {
                case MASTER_MINOR:
-                       sprintf(name, "bus/vme/m%%d");
+                       name = "bus/vme/m%d";
                        break;
                case CONTROL_MINOR:
-                       sprintf(name, "bus/vme/ctl");
+                       name = "bus/vme/ctl";
                        break;
                case SLAVE_MINOR:
-                       sprintf(name, "bus/vme/s%%d");
+                       name = "bus/vme/s%d";
                        break;
                default:
                        err = -EINVAL;



Regards,
Bojan
