From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 10 May 2015 13:20:14 +0000
Subject: type mismatch
Message-Id: <alpine.DEB.2.10.1505101517100.2645@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I came across the following code
(drivers/gpu/drm/nouveau/nvkm/subdev/i2c/pad.h):

struct nvkm_i2c_pad {
        struct nvkm_object base;
        int index;
        struct nvkm_i2c_port *port;
        struct nvkm_i2c_port *next;
};

static inline struct nvkm_i2c_pad *
nvkm_i2c_pad(struct nvkm_i2c_port *port)
{
 	struct nvkm_object *pad = nv_object(port);
	while (!nv_iclass(pad->parent, NV_SUBDEV_CLASS))
		pad = pad->parent;
	return (void *)pad;
}

Would it be better for the return to use container_of, rather than a cast
that happens to work because of the position of the nvkm_object field?

julia
