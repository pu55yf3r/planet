.PHONY: all

all: k8s-master.mk
	cp -af ./generate-serviceaccount-key.service $(ROOTFS)/lib/systemd/system
	ln -sf /lib/systemd/system/generate-serviceaccount-key.service  $(ROOTFS)/lib/systemd/system/multi-user.target.wants/

	cp -af ./kube-apiserver.service $(ROOTFS)/lib/systemd/system
	ln -sf /lib/systemd/system/kube-apiserver.service  $(ROOTFS)/lib/systemd/system/multi-user.target.wants/

	cp -af ./kube-controller-manager.service $(ROOTFS)/lib/systemd/system
	ln -sf /lib/systemd/system/kube-controller-manager.service  $(ROOTFS)/lib/systemd/system/multi-user.target.wants/

	cp -af ./kube-scheduler.service $(ROOTFS)/lib/systemd/system
	ln -sf /lib/systemd/system/kube-scheduler.service  $(ROOTFS)/lib/systemd/system/multi-user.target.wants/

	install -m 0755 $(OUT)/kube-apiserver $(ROOTFS)/usr/bin
	install -m 0755 $(OUT)/kube-controller-manager $(ROOTFS)/usr/bin
	install -m 0755 $(OUT)/kube-scheduler $(ROOTFS)/usr/bin
	install -m 0755 $(OUT)/kubectl $(ROOTFS)/usr/bin
