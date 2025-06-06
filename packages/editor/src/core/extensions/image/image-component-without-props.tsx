import { mergeAttributes } from "@tiptap/core";
import { Image } from "@tiptap/extension-image";
// extensions
import { ImageExtensionStorage } from "@/plugins/image";

export const CustomImageComponentWithoutProps = () =>
  Image.extend<Record<string, unknown>, ImageExtensionStorage>({
    name: "imageComponent",
    selectable: true,
    group: "block",
    atom: true,
    draggable: true,

    addAttributes() {
      return {
        ...this.parent?.(),
        width: {
          default: "35%",
        },
        src: {
          default: null,
        },
        height: {
          default: "auto",
        },
        ["id"]: {
          default: null,
        },
        aspectRatio: {
          default: null,
        },
      };
    },

    parseHTML() {
      return [
        {
          tag: "image-component",
        },
      ];
    },

    renderHTML({ HTMLAttributes }) {
      return ["image-component", mergeAttributes(HTMLAttributes)];
    },

    addStorage() {
      return {
        fileMap: new Map(),
        deletedImageSet: new Map<string, boolean>(),
        uploadInProgress: false,
        maxFileSize: 0,
        assetsUploadStatus: {},
      };
    },
  });

export default CustomImageComponentWithoutProps;
