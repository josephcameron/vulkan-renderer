// © 2018 Joseph Cameron - All Rights Reserved
// Created on 2018-04-16.
#ifndef VKRENDERER_VERTEX_H
#define VKRENDERER_VERTEX_H

#include <glm/glm.hpp>
#include <vulkan/vulkan.h>

#include <array>
#include <type_traits>

namespace vkrenderer
{
///@brief Vertex definition.
///@todo Should be extenible. Statically via templates.
///@warning Uses offsetof and is not POD. This does not comply strictly with standard! Bad!
///@warning is WIP
struct Vertex final
{
    friend bool operator==(const Vertex &a, const Vertex &b);

    glm::vec3 pos      = {};
    glm::vec3 color    = {};
    glm::vec2 texCoord = {};

    static VkVertexInputBindingDescription getBindingDescription();

    static std::array<VkVertexInputAttributeDescription, 3> getAttributeDescriptions();
};

bool operator==(const Vertex &a, const Vertex &b);

// static_assert(std::is_pod<Vertex>::value, "Vertex must be pod.");
}

#endif
